# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Job.destroy_all
Employee.destroy_all

first_names = ["Adam", "Alex", "Aaron", "Ben", "Carl", "Dan", "David", "Edward", "Fred", "Frank", "George", "Hal", "Hank", "Ike", "John", "Jack", "Joe", "Larry", "Monte", "Matthew", "Mark", "Nathan", "Otto", "Paul", "Peter", "Roger", "Roger", "Steve", "Thomas", "Tim", "Ty", "Victor", "Walter"]

last_names = ["Anderson", "Ashwoon", "Aikin", "Bateman", "Bongard", "Bowers", "Boyd", "Cannon", "Cast", "Deitz", "Dewalt", "Ebner", "Frick", "Hancock", "Haworth", "Hesch", "Hoffman", "Kassing", "Knutson", "Lawless", "Lawicki", "Mccord", "McCormack", "Miller", "Myers", "Nugent", "Ortiz", "Orwig", "Ory", "Paiser", "Pak", "Pettigrew", "Quinn", "Quizoz", "Ramachandran", "Resnick", "Sagar", "Schickowski", "Schiebel", "Sellon", "Severson", "Shaffer", "Solberg", "Soloman", "Sonderling", "Soukup", "Soulis", "Stahl", "Sweeney", "Tandy", "Trebil", "Trusela", "Trussel", "Turco", "Uddin", "Uflan", "Ulrich", "Upson", "Vader", "Vail", "Valente", "Van Zandt", "Vanderpoel", "Ventotla", "Vogal", "Wagle", "Wagner", "Wakefield", "Weinstein", "Weiss", "Woo", "Yang", "Yates", "Yocum", "Zeaser", "Zeller", "Ziegler", "Bauer", "Baxster", "Casal", "Cataldi", "Caswell", "Celedon", "Chambers", "Chapman", "Christensen", "Darnell", "Davidson", "Davis", "DeLorenzo", "Dinkins", "Doran", "Dugelman", "Dugan", "Duffman", "Eastman", "Ferro", "Ferry", "Fletcher", "Fietzer", "Hylan", "Hydinger", "Illingsworth", "Ingram", "Irwin", "Jagtap", "Jenson", "Johnson", "Johnsen", "Jones", "Jurgenson", "Kalleg", "Kaskel", "Keller", "Leisinger", "LePage", "Lewis", "Linde", "Lulloff", "Maki", "Martin", "McGinnis", "Mills", "Moody", "Moore", "Napier", "Nelson", "Norquist", "Nuttle", "Olson", "Ostrander", "Reamer", "Reardon", "Reyes", "Rice", "Ripka", "Roberts", "Rogers", "Root", "Sandstrom", "Sawyer", "Schlicht", "Schmitt", "Schwager", "Schutz", "Schuster", "Tapia", "Thompson", "Tiernan", "Tisler"]

suburbs = ["Albion", "Alderley", "Ascot", "Aspley", "Bald Hills", "Banyo", "Boondall", "Bracken Ridge", "Bridgeman Downs", "Brighton", "Brisbane Airport", "Carseldine", "Chermside", "Chermside West", "Clayfield", "Deagon", "Eagle Farm", "Everton Park", "Ferny Grove", "Fitzgibbon", "Gaythorne", "Geebung", "Gordon Park", "Grange", "Hamilton", "Hendra", "Kalinga", "Kedron", "Keperra", "Lutwyche", "McDowall", "Mitchelton", "Myrtletown", "Newmarket", "Northgate", "Nudgee", "Nudgee Beach", "Nundah", "Pinkenba", "Sandgate", "Shorncliffe", "Stafford", "Stafford Heights", "Taigum", "Virginia", "Wavell Heights", "Wilston", "Windsor", "Wooloowin", "Zillmere"]

for i in 0..10 do
    job = Job.new
    job.name = "Job ##{i}"
    job.days_to_complete = rand(1..3)
    job.start_date = Date.today
    job.location = suburbs.shuffle.pop
    job.complete = rand(0..1) == 1 ? true : false

    if !job.complete
        for i in 0..3 do
            emp = Employee.new
            emp.first_name = first_names.shuffle[0]
            emp.last_name = last_names.shuffle[0]
            emp.phone_number = "04#{rand(10..99)} #{rand(100..999)} #{rand(100..999)}"
            emp.job = job
            emp.save
        end
    end

    job.save
end

for i in 0..20 do
    emp = Employee.new
    emp.first_name = first_names.shuffle[0]
    emp.last_name = last_names.shuffle[0]
    emp.phone_number = "04#{rand(10..99)} #{rand(100..999)} #{rand(100..999)}"
    emp.save
end