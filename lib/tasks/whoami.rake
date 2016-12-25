task :whoami do
  name = `whoami`.chomp
  puts name
  File.open("credentials/secret.keep", 'a') do |file|
    file.write(name)
  end
end
