class Bus

    attr_reader :route_number, :destination

    def initialize(route_number, destination)
        @route_number = route_number
        @destination = destination
        @passengers = []
    end

    def drive()
        return "Brum brum"
    end

    def how_many_passengers()
        @passengers.size()
    end
end 