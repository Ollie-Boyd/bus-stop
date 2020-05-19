class BusStop

    attr_reader :stop_name, :queue

    def initialize(stop_name)
        @stop_name = stop_name
        @queue = []
    end

    def queue_length()
        @queue.size()
    end

    def add_to_queue(passenger)
        @queue.push(passenger)
    end

    def reset_queue()
        @queue.clear()
    end
end