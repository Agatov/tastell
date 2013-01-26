ThinkingSphinx::Index.define :place, :with => :active_record do
  indexes name, address, phone
end