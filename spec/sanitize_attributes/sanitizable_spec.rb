require 'spec_helper'

describe 'Sanitizable' do
  describe 'sets custom elements' do
    let(:sanitize_attributes) { SanitizeAttributes }

    before :each do
      sanitize_attributes.configure do |config|
        config.keep_elements = %w(b u i)
      end

      expect(sanitize_attributes.configuration.keep_elements).to eq %w(b u i)
    end

    after :each do
      sanitize_attributes.reset # reset back to defaults
    end

    %w(b i u).each do |tag|
      it "should keep #{tag}" do
        html = "<#{tag}>tag #{tag}</#{tag}>"
        sanitizable = SanitizableModel.new(name: 'any name', short_description: html, long_description: html)

        expect(sanitizable.name).to eq 'any name'
        expect(sanitizable.short_description).to eq html
        expect(sanitizable.long_description).to eq html
      end
    end

    %w(h1 h2 h3 p pre).each do |tag|
      it "should remove #{tag}" do
        html = "<#{tag}>tag #{tag}</#{tag}>"
        sanitizable = SanitizableModel.new(name: 'any name', short_description: html, long_description: html)

        expect(sanitizable.name).to eq 'any name'
        expect(sanitizable.short_description).to eq "tag #{tag}"
        expect(sanitizable.long_description).to eq html
      end
    end
  end

  it 'should sanitize href' do
    html = '<a href="http://example.com">example</a>'
    sanitizable = SanitizableModel.new(name: 'any name', short_description: html, long_description: html)

    expect(sanitizable.name).to eq 'any name'
    expect(sanitizable.short_description).to eq 'example'
    expect(sanitizable.long_description).to eq html
  end

  %w(h1 h2 h3 p pre b i u).each do |tag|
    it "should keep #{tag}" do
      html = "<#{tag}>tag #{tag}</#{tag}>"
      sanitizable = SanitizableModel.new(name: 'any name', short_description: html, long_description: html)

      expect(sanitizable.name).to eq 'any name'
      expect(sanitizable.short_description).to eq html
      expect(sanitizable.long_description).to eq html
    end
  end

  it 'should keep br' do
    html = '<br>tag br<br>'
    sanitizable = SanitizableModel.new(name: 'any name', short_description: html, long_description: html)

    expect(sanitizable.name).to eq 'any name'
    expect(sanitizable.short_description).to eq html
    expect(sanitizable.long_description).to eq html
  end

  %w(code strong table td tr thead).each do |tag|
    it "should remove #{tag}" do
      html = "<#{tag}>tag #{tag}</#{tag}>"
      sanitizable = SanitizableModel.new(name: 'any name', short_description: html, long_description: html)

      expect(sanitizable.name).to eq 'any name'
      expect(sanitizable.short_description).to eq "tag #{tag}"
      expect(sanitizable.long_description).to eq html
    end
  end
end
