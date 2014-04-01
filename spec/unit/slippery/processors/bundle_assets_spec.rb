require 'spec_helper'

describe Slippery::Processors::BundleAssets do
  let(:hexp_node) { H[:p] }
  let(:strategy) { described_class::NullStrategy.new }

  subject { described_class.new(strategy) }

  describe '#call' do
    let(:h_img) {
      H[
        :img,
        src: 'https://pbs.twimg.com/profile_images/422518784289550336/IL4gKwHX.png'
      ]
    }

    it 'should transform nodes into nodes' do
      expect(subject.call(H[:p])).to eq H[:p]
    end

    context 'for each img node' do
      it 'should call "convert_image"' do
        expect(strategy).to receive(:convert_image)
          .with(h_img)
          .and_return(hexp_node)

        subject.call(h_img)
      end

      it 'should replace the image with the returned value' do
        strategy.stub(convert_image: hexp_node)
        expect(subject.call(h_img)).to eq hexp_node
      end
    end
  end

end