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

  specify do
    should respond_to(:[])
  end

  it 'finds a model by the id' do
    a = Battlestar.create(name: 'Galactica')
    Battlestar.create(name: 'Pegasus')
    Battlestar[a.id].name.should == 'Galactica'
  end

  context "when the unique fields are specified" do
    before do
      Battlestar.const_set("UNIQUE_IDENTIFIER_FIELD_NAMES", [:id, :name])
    end

    it 'finds a model by one of the unique field' do
      a = Battlestar.create(name: 'Galactica')
      Battlestar.create(name: 'Pegasus')
      Battlestar[a.name].name.should == 'Galactica'
    end

    it "doesn't find models by non-specified fields" do
      a = Battlestar.create(name: 'Galactica')
      Battlestar.create(name: 'Pegasus')
      Battlestar[a.name].name.should == 'Galactica'
    end
  end
end
