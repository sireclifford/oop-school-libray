class Person
    def initialize(name = "Unknown", age, parent_permission=true)
        @id = id
        @name = name
        @age = age
    end

    def id
        @id
    end

    def name
        @name
    end

    def age
        @age
    end
    def can_use_services?
        @parent_permission || is_of_age?
    end

    def is_of_age?
        @age >= 18
    end

end