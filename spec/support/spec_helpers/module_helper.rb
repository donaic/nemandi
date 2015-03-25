module ModuleHelper
  def validate_optional_attributes(factory, *attrs)
    context "Optional Attributes:" do
      attrs.each do |attribute|
        it "is valid without a #{attribute}" do
          obj = build(factory)
          obj.__send__("#{attribute.to_sym}=", nil)
          expect(obj).to be_valid
        end
      end
    end
  end

  def validate_required_attributes(factory, *attrs)
    context "Required Attributes:" do
      attrs.each do |attribute|
        it "is invalid without a #{attribute}" do
          obj = build(factory)
          obj.__send__("#{attribute.to_sym}=", nil)
          expect(obj).to_not be_valid
        end
      end
    end
  end

  def validate_optional_associations(factory, *asscs)
    context "Optional Associations:" do
      asscs.each do |a|
        it "is valid without #{a}" do
          obj = build(factory)
          association = obj.class.reflect_on_association(a).macro
          if association == :has_one || association == :belongs_to
            obj.association(a).replace(nil)
          elsif association == :has_many
            obj.association(a).destroy_all()
          else
            raise UnknownAssociationError
          end
          expect(obj).to be_valid
        end
      end
    end
  end

  def validate_required_associations(factory, *asscs)
    context "Required Associations:" do
      asscs.each do |a|
        it "is invalid without #{a}" do
          obj = build(factory)
          association = obj.class.reflect_on_association(a).macro
          if association == :has_one || association == :belongs_to
            obj.association(a).replace(nil)
          elsif association == :has_many
            obj.association(a).destroy_all()
          else
            raise UnknownAssociationError
          end
          expect(obj).to_not be_valid
        end
      end
    end
  end
end
