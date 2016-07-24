require 'rails_helper'

describe Child do
  let (:child) {Child.create(name: 'Jax', parent_id: 1, allergies: 'trolls', birthday: '2016-09-28')}

  it "should have a name" do
    expect(child.name).to eq('Jax')
  end
it "should have a parent" do
    expect(child.parent_id).to be_a Integer
  end
it "should have allergies" do
    expect(child.allergies).to eq('trolls')
  end

  it "should have a birthday" do
    expect(child.birthday).to be_a_kind_of Date
  end
end
