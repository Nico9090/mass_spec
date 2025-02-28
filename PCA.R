set.seed(123)
dept_costs <- runif(50, min = 100000, max = 2000000000)
dept_earnings<-runif(50,min=0,max=800000000000)
sample_data<-data.frame(Dept=c("Human Resources","Marketing","Finance","Sales",
                               "IT","Legal","Customer Service",
                               "Research and Development","Product Management",
                               "Procurement","Supply Chain","Public Relations",
                               "Communications","Compliance","Strategy",
                               "Business Development","Risk Management","Audit", 
                               "Quality Assurance","Manufacturing","Engineering",
                               "Data Analytics","Advertising",
                               "Event Planning","Executive Management",
                               "Corporate Affairs","Investor Relations",
                               "Logistics","Legal Affairs","Content Creation",
                               "Training and Development","Administration",
                               "Product Design","Health and Safety","Sustainability", 
                               "Facilities Management","IT Security","International Relations", 
                               "Talent Acquisition","Partnerships","Mergers and Acquisitions", 
                               "Corporate Governance", "Digital Transformation","Social Media", 
                               "Customer Experience","E-commerce","Creative Services", 
                               "Internal Communications", "Technology", "Innovation"),
                        Costs=dept_costs,
                        Earnings=dept_earnings)
sample_data
