require 'spec_helper'

describe ActiveRecordExtensions do
  subject { Battlestar }

  before(:each) do
    build_model :battlestars do
      string :name
      integer :viper_capacity

      validates_uniqueness_of :name

      def awesome?
        true
      end
    end
  end

  it { should respond_to(:[]) }

  shared_examples_for "an unconfigured boxey model" do
    let!(:galactica) { Battlestar.create({ id: 1, name: 'Galactica', viper_capacity: 23 }) }
    let!(:pegasus) { Battlestar.create({ id: 2, name: 'Pegasus', viper_capacity: 27 }) }

    it 'finds a model by the id' do
      Battlestar[2].should == pegasus
    end

    it "doesn't find models by other fields" do
      Battlestar['Galactica'].should be_nil
      Battlestar[23].should be_nil
    end
  end

  shared_examples_for "a boxey model configured for id and name" do
    let!(:galactica) { Battlestar.create({ id: 1, name: 'Galactica', viper_capacity: 23 }) }
    let!(:pegasus) { Battlestar.create({ id: 2, name: 'Pegasus', viper_capacity: 27 }) }

    it 'finds a model by one of the unique fields' do
      Battlestar['Pegasus'].should == pegasus
    end

    it "doesn't find models by non-specified fields" do
      Battlestar[23].should be_nil
    end
  end

  context "when boxey is not specified on the model" do
    it_behaves_like "an unconfigured boxey model"
  end

  context "when boxey is specified on the model with no arguments" do
    before do
      Battlestar.send(:boxey)
    end

    it_behaves_like "an unconfigured boxey model"
  end

  context "when the unique fields are specified as an array" do
    before do
      Battlestar.send(:boxey, [:id, :name])
    end

    it_behaves_like "a boxey model configured for id and name"
  end

  context "when the unique fields are specified as separate symbol arguments" do
    before do
      Battlestar.send(:boxey, 'id', 'name')
    end

    it_behaves_like "a boxey model configured for id and name"
  end
end
