require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }

    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
      it '30文字以下であること' do
        test_user.name = 'a' * 31
        is_expected.to eq false;
      end
    end

    context 'emailカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.email = ''
        is_expected.to eq false;
      end
    end

    context 'profileカラム' do
      let(:test_user) { user }
        it '250文字以下であること' do
        test_user.profile = 'a' * 251
        is_expected.to eq false;
      end
    end

    context 'rankカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.rank = ''
        is_expected.to eq false;
      end
    end

    context 'is_activeカラム' do
      let(:test_user) { user }
      it 'Boolean値が入っていること' do
        test_user.is_active = ''
        is_expected.to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Questionモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:questions).macro).to eq :has_many
      end
    end
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Ratingモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:ratings).macro).to eq :has_many
      end
    end
  end
end
