RSpec.describe Message do
  let!(:user1)   { FactoryBot.create :user, username: 'user1' }
  let!(:user2)   { FactoryBot.create :user }
  let!(:message) { FactoryBot.create :message }
  let!(:today)   { Date.today }

  describe "creating a message" do
    context "without a body" do
      it "should not be allowed" do
        message = Message.new(message: 'test@test.com')
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
    end

    context "without an email" do
      it "should not be allowed" do
        user = User.new(email: '', password: '123456')
        user.valid?
        expect(user.errors[:email]).to include("is not an email")
      end
    end

    context "with a valid email and password" do
      it "should be successful"  do
        user = User.new(email: 'test@test.com', password: '123456')
        expect(user.valid?).to eq(true)
      end
    end
  end

end
