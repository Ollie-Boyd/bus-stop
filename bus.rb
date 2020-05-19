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

    def pick_up(passenger)
        @passengers.push(passenger)
    end

    def drop_off(passenger)
        @passengers.delete(passenger)
    end

    def empty_bus()
        @passengers.clear()
    end

    def pick_up_from_stop(bus_stop)
         @passengers += bus_stop.queue 
         bus_stop.reset_queue
    end
    
end 