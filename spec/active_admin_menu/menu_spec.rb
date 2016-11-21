require "spec_helper"

describe ActiveAdminMenu::Menu do
  describe ".build" do
    let(:namespaced_source) do
      {
        "root"  => %w(Dashboard),
        "Admin" => %w(AdminUser Comment),
      }
    end

    subject(:menu) { described_class.build }

    before do
      expect(described_class).to receive(:namespaced_source).and_return(namespaced_source)
    end

    it { should be_a described_class }

    it "should append items" do
      menu.items.size.should be 3
    end
  end

  describe "#find_item_by" do
    let(:instance) { described_class.new }

    subject { instance.find_item_by(resource_name: resource_name) }

    before do
      instance.add(resource_name: "Dashboard")
    end

    context "with match" do
      let(:resource_name) { "Dashboard" }
      it { should be_a ActiveAdminMenu::Item }
    end

    context "with mismatch" do
      let(:resource_name) { "Mismatch" }
      it { should be_nil }
    end
  end

  describe "#add" do
    let(:instance) { described_class.new }
    let(:resource_name) { "AdminUser" }
    let(:parent) { "Admin" }
    let(:item) { instance.items[0] }

    subject { instance.add(resource_name: resource_name, parent: parent) }

    it "should add item" do
      subject
      item.should_not be_nil
      item.should be_a ActiveAdminMenu::Item
      item.resource_name.should eq resource_name
      item.parent.should eq parent
      item.priority.should eq 1
    end
  end
end
