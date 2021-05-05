# Step 1
# Parse code directly
puts "Current ruby version #{RUBY_VERSION}"
p `docker run ruby:2.7.1 ruby -e 'puts RUBY_VERSION'`


# Step 2
# Parse code from file

user_input = '
class Cat
  def initialize(name)
    @name = name
  end

  def name
    "My name is #{@name}"
  end
end

 c1 = Cat.new("Kitty")
 p c1.name'

out_file = File.new("out.txt", "w")
out_file.write user_input
out_file.close

p `docker run -v ~/Desktop/astro/7/docker_parse_code_example/out.txt:/mnt/mydata ruby:2.7.1 ruby /mnt/mydata`
