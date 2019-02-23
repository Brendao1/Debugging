describe FileSystem do
  it 'can add items to storage' do
    # Arrange
    # First you Arrange all the preconditions required for your code to run -
    # creating any objects that you’re going to need.
    file_system = FileSystem.new
    file = File.new

    # Act
    # Next, you act or execute the code which needs to be run in order for your assertion to be true.
    file_system.store(file)

    #Assert
    # Finally, you make the assertion itself.
    expect(file_system.storage).to include(file)
  end
end
