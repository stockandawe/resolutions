describe Resolution do

  before(:each) { @user = User.new(email: 'user@example.com') }
  before(:each) { @resolution = Resolution.new(user_id: @user.id, title: "I am going to change the world.") }

  subject { @resolution }

  it { should respond_to(:title) }

  it "#title returns a string" do
    expect(@resolution.title).to match 'I am going to change the world.'
  end

end
