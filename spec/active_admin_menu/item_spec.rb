require "spec_helper"

describe ActiveAdminMenu::Item do
  describe "#to_options" do
    let(:instance) do
      described_class.new(resource_name: "Dashboard", parent: parent, priority: 1)
    end
    let(:parent) { nil }

    subject(:options) { instance.to_options }

    context "when is_page is true" do
      before { instance.is_page = true }
      it { options.keys.should match_array %i(priority label) }
    end

    context "when is_page is falsey" do
      it { options.keys.should match_array %i(priority) }
    end

    context "when parent is not nil" do
      let(:parent) { "Admin" }
      it { options.keys.should match_array %i(priority parent) }
    end
  end
end
