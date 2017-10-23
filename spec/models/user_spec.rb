RSpec.describe User do

  describe "creating a user" do
    context "without a password" do
      it "should not be allowed" do
        user = User.new(email: 'test@test.com')
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
