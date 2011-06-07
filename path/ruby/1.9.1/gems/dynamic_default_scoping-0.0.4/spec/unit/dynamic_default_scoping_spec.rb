require 'spec_helper'

describe DynamicDefaultScoping do
  let :locales do
    [ :en, :ru ]
  end

  let :per_locale do
    hash = {}
    locales.each_with_index { |locale, i| hash[locale] = 3 + i }
    hash
  end

  before do
    I18n.stub(:available_locales).and_return locales
    per_locale.each do |locale, count|
      count.times { Post.create! :locale => locale.to_s }
    end
  end

  describe 'when switching between locales' do
    around do |block|
      locales.each do |locale|
        I18n.locale = locale
        block.call
      end
    end

    shared_examples_for 'a well localized class' do
      it 'generates the right query' do
        part = if @locale.is_a? Array
          %[`locale` IN (#{ @locale.map{ |l| "'#{ l }'" }.join(', ') })]
        else
          %[`locale` = '#{ @locale }']
        end
        @relation.to_sql.should include part
      end

      it 'finds records only in the current locale' do
        [ @relation.first, @relation.all ].should have_valid_locale @locale
      end

      it 'counts records only in the current locale' do
        count = Array.wrap(@locale).map{ |l| per_locale[l] }.sum
        @relation.count.should == count
      end
    end

    context 'when the locale is not specified' do
      before do
        @relation, @locale = Post.scoped, I18n.locale
      end

      it_behaves_like 'a well localized class'
    end

    context 'when the locale is specified' do
      context 'when there is another scope before' do
        around do |block|
          locales.each do |locale|
            @relation, @locale = Post.recent.language(locale), locale
            block.call
          end
        end

        it_behaves_like 'a well localized class'
      end

      context 'when there is another scope after' do
        around do |block|
          locales.each do |locale|
            @relation, @locale = Post.language(locale).recent, locale
            block.call
          end
        end

        it_behaves_like 'a well localized class'
      end

      context 'when there is no another scope' do
        around do |block|
          locales.each do |locale|
            @relation, @locale = Post.language(locale), locale
            block.call
          end
        end

        it_behaves_like 'a well localized class'
      end
    end

    context 'when we are interested in all locales' do
      before do
        @relation, @locale = Post.language(:any), locales
      end

      it_behaves_like 'a well localized class'
    end
  end
end
