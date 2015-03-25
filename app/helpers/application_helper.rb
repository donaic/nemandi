module ApplicationHelper
=begin
  def method_missing(meth, *args, &block)
    if meth.to_s =~ /^find_all_(.+s)$/
      # Find all Users with a given role in a given model.
      #
      # For example, this will find all Users who are Students in a given School.
      # => students = find_all_students(@school)
      #
      # def find_all_#{role1}_and_#{role2}...(@model)
      #   User.joins(:#{model}_roles)
      #       .where((title = ? OR title = ? ...) AND klass_id = ?,
      #             #{role1}, #{role2}, ..., @model)
      # end
      self.class.class_eval do
        define_method(meth) do |*args, &block|
          attrs = $1.split('_and_')
          conditions = format_find_all_conditions(attrs, *args, &block)
          model = "#{controller_name.downcase.singularize}_roles".to_sym
          User.joins(model).where(conditions).distinct
        end
      end
      send(meth, *args) #__send__??
    else
      super
    end
  end

  def respond_to_missing?(meth)
    if meth.to_s =~ /^find_all_(.+s)$/
      # Determines if a method in the form of:
      # find_all_#{role1}_and_#{role2}...(@model) exists within the context.
      # If so, will respond with TRUE, otherwise it will call super.
      true
    else
      super
    end
  end

  private
    # Format conditions:
    # conditions = '(title = ? OR title = ? ...) AND klass_id = ?'
    def format_find_all_conditions(attrs, *args, &block)
      titles = (['title = ?']*attrs.size).join(' OR ')
      conditions = []
      conditions << '(' + titles + ") AND #{controller_name.downcase.singularize}_id = ?"
      attrs.each_with_index do |a, i|
        conditions << a.singularize
      end
      conditions << args.first.id
    end
=end
end
