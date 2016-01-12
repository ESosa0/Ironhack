require 'pry'

class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee

		attr_reader(:hourly_rate,:hours_worked)

    def initialize(name, email, hourly_rate, hours_worked = 40)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary()
      	weekly_salary = @hourly_rate * @hours_worked
      	puts "Weekly salary #{weekly_salary}"
    end
end

class SalariedEmployee < Employee

	attr_reader(:year_salary)

	def initialize(name,email,year_salary)
		@name = name 
		@email = email
		@year_salary = year_salary
	end

	def calculate_salary()
		weekly_salary = @year_salary/52
		puts "Weekly salary  #{weekly_salary}"
	end

end

class MultiPaymentEmployee < Employee

	attr_reader(:year_salary,:hours_worked,:extrapay)

	def initialize(name,email,year_salary,extrapay,hours_worked)
		@name = name
		@email = email
		@year_salary = year_salary
		@hours_worked = hours_worked
		@extrapay = extrapay
	end

	def calculate_salary
		if hours_worked > 40 
			weekly_salary = (@year_salary/52) + ((@hours_worked - 40) * extrapay)
		else 
			weekly_salary = @year_salary/52
		end

		puts "Weekly salary #{weekly_salary}"

	end

end

class Payroll
		attr_reader :employees
    def initialize(employees)
        @employees = employees
    end

  	def pay_employees 
    	@employees.each {|i| puts i.name 
    		puts i.calculate_salary}

  	end
end


carlos = HourlyEmployee.new('Carlos', 'carlos@email.com', 15)
erica = HourlyEmployee.new('Erica', 'erica@email.com', 15)
josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

employees = [josh, nizar, ted, erica, carlos]
payroll = Payroll.new(employees)
payroll.pay_employees
# josh => 1750
# nizar => 19230
# etc
# etc

ted.calculate_salary
