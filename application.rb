require 'csv'

puts "Please enter the questions filename, including the .csv"
filename = gets.chomp #get input from user

read_questions = CSV.read("../example-data/#{filename}", headers:true) #load the file
  read_questions.each do |row| # go through each line and print it out
  #p row
end


completed_surveys = []
total_surveys = []

read_answers = "#{filename.gsub!(".csv", "")}-responses.csv" #find answers filename based off current questions filename

read_answers = CSV.read("../example-data/#{read_answers}", converters: :all) #load the answers file
  read_answers.each do |row| #go through each line and print it out
  if !!row[2]
    completed_surveys << row[2]
  end
  total_surveys << row

  puts  "Email:#{row[0]}     Id: #{row[1]}  Completed on: #{row[2]}     Answer 1 ==> #{row[3]}"
end

puts "Total completed surveys #{completed_surveys.count}"
puts "Total surveys #{total_surveys.count}"
puts "Survey completion percentage: #{((completed_surveys.count.to_f / total_surveys.count.to_f) * 100).round(2)}%"
