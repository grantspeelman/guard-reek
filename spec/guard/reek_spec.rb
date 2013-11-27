require 'spec_helper'

describe Guard::Reek do
  subject { reek }
  let(:guard) { described_class.new }

  before do
    Guard::Notifier.stub :notify

    Guard::UI.stub :info
    Guard::UI.stub :error
  end

  describe "#start" do
    subject(:start) { guard.start }

    it "runs all" do
      guard.should_receive :run_all

      start
    end
  end

  describe "#run_all" do
    subject(:run_all) { guard.run_all }

    it "runs reek" do
      described_class.should_receive(:reek).with([])

      run_all
    end
  end

  describe "#run_on_modifications" do
    subject(:run_on_modifications) { guard.run_on_modifications "path" }

    it "runs changed paths" do
      described_class.should_receive(:reek).with("path")

      run_on_modifications
    end
  end

  describe ".reek" do
    before do
      described_class.stub(:system)
      described_class.stub(:command)
      described_class.stub(:system).and_return(true)
    end

    subject(:reek) { described_class.reek("paths") }

    it "calls the system" do
      described_class.should_receive(:system)
    end

    it "calls the reek command" do
      described_class.should_receive(:command).with("paths")
    end

    it "notifies guard the ddsuccess" do
      described_class.should_receive(:notify)
    end

    after do
      reek
    end
  end

  describe ".command" do
    subject(:command) { described_class.command ["path"] }
    it { should =~ /-n/ }
    it { should =~ /^reek/ }
    it { should =~ /path$/ }
  end

  describe ".notify" do
    context "well done" do
      subject(:notify) { described_class.notify true }
      it "notifies the success to notifier" do
        Guard::Notifier.should_receive(:notify).with(*Guard::Reek::SUCCESS)

        notify
      end
    end

    context "something went wrong" do
      subject(:notify) { described_class.notify false }
      it "notifies the failure to notifier" do
        Guard::Notifier.should_receive(:notify).with(*Guard::Reek::FAILED)

        notify
      end
    end
  end
end
