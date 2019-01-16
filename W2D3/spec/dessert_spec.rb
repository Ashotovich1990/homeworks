require 'rspec'
require 'dessert'
require 'chef'
=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { Chef.new("chef") }
  subject(:desert) { Dessert.new("cheesecake",100,chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(desert.type).to eq("cheesecake")
    end

    it "sets a quantity" do
      expect(desert.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(desert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
       expect { Dessert.new("cheesecake","1","Aram") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) { desert.add_ingredient("cheese")}

    it "adds an ingredient to the ingredients array" do
      expect(desert.ingredients).to include("cheese")
    end
  end

  describe "#mix!" do
    before(:each) { desert.add_ingredient("cheese")}
    before(:each) { desert.add_ingredient("more cheese")}
    before(:each) { desert.add_ingredient("again cheese")}
    before(:each) { desert.mix! }

    it "shuffles the ingredient array" do
      expect(desert.ingredients).to_not eq(["cheese","more cheese","again cheese"])
    end
  end

  describe "#eat" do
    before(:each) { desert.eat(50) }

    it "subtracts an amount from the quantity" do
      expect(desert.quantity).to eq(50)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { desert.eat(60) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do

    it "contains the titleized version of the chef's name" do
      expect(desert.serve).to include("Chef")
    end
  end

  describe "#make_more" do


    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(desert)
      desert.make_more
    end
  end
end
