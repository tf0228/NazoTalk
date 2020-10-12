require 'rails_helper'

RSpec.describe 'Questionモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:question) { build(:question, user_id: user.id) }
    subject { test_question.valid? }

    context 'numberカラム' do
      let(:test_question) { question }
      it '空欄でないこと' do
        test_question.number = ''
        is_expected.to eq false;
      end
      it '数値が入っていること' do
        test_question.number = 'number'
        is_expected.to eq false;
      end
      it '一意であること' do
        duplicate_question = question.dup
        duplicate_question.save
        is_expected.to eq false;
      end
    end

    context 'hint_1カラム' do
      let(:test_question) { question }
      it '50文字以下であること' do
        test_question.hint_1 = 'a' * 51
        is_expected.to eq false;
      end
    end

    context 'hint_2カラム' do
      let(:test_question) { question }
      it '50文字以下であること' do
        test_question.hint_2 = 'a' * 51
        is_expected.to eq false;
      end
    end

    context 'hint_3カラム' do
      let(:test_question) { question }
      it '50文字以下であること' do
        test_question.hint_3 = 'a' * 51
        is_expected.to eq false;
      end
    end

    context 'answerカラム' do
      let(:test_question) { question }
      it '空欄でないこと' do
        test_question.answer = ''
        is_expected.to eq false;
      end
      it '50文字以下であること' do
        test_question.answer = 'a' * 51
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Question.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'Ratingモデルとの関係' do
      it '1:Nとなっている' do
        expect(Question.reflect_on_association(:ratings).macro).to eq :has_many
      end
    end
  end
end
