require 'java'
require 'atom_visits'

include RSpec::Matchers

java_import org.springframework.samples.petclinic.Pet
java_import org.springframework.samples.petclinic.PetType
java_import org.springframework.samples.petclinic.Visit

describe 'Atom Visits Feed' do

  before(:all) do
      pet_type = PetType.new
      pet_type.name = "dog"
      @pet = Pet.new
      @pet.name = "Luther"
      @pet.type = pet_type
      @visit = Visit.new
      @visit.pet = @pet
      @visit.date = Time.parse("2007/2/11")
      @visit.description = "Ate a box of chocolates"
  end

  it 'should not blow up with no visits' do
    content = visits_to_atom("http://localhost:8080", Array.new)
    content.should_not be_nil
  end

  it 'should return valid results on a single visit' do
    content = visits_to_atom("http://localhost:8080", [@visit])
    content.should_not be(nil)
  end
end
