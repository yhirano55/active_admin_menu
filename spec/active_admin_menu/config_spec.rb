require "spec_helper"

describe ActiveAdminMenu::Config do
  describe "configurable" do
    describe ".configure" do
      subject do
        ActiveAdminMenu.configure do |config|
          config.namespace = "development"
        end
      end

      it { expect { subject }.not_to raise_error }
    end

    describe ".config" do
      subject { ActiveAdminMenu.config }

      it { should be_a described_class }
    end
  end

  describe "Instance" do
    let(:instance) { described_class.new }

    describe "#source=" do
      subject { instance.source = value }

      context "when value is a Hash" do
        let(:value) { { default: 123 } }
        it { should eq value }
      end

      context "when value is path to yaml" do
        let(:value) { File.expand_path("../../../lib/generators/active_admin_menu/templates/active_admin_menu.yml", __FILE__) }

        it "should set Hash from YAML" do
          instance.source.should be_empty
          subject
          instance.source.should_not be_empty
          instance.source.should be_a Hash
        end
      end
    end

    describe "#namespaced_source" do
      subject { instance.namespaced_source }

      context "when namespace is nil" do
        it { should eq instance.source }
      end

      context "when namespace is not nil" do
        before do
          instance.source = { "development" => {} }
          instance.namespace = "development"
        end

        it { should be_a Hash }
      end
    end
  end
end
