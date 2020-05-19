require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus')
require_relative('../person')
require_relative('../bus_stop.rb')

class BusStopTest < Minitest::Test

    def setup
        @bus = Bus.new(22, "Ocean Terminal")
        @person1 = Person.new("Harrison", 86)
        @person2 = Person.new("Jim", 19)
        @bus_stop = BusStop.new("Princess Street")
    end

    def test_get_person_name_plus_age()
        assert_equal("Harrison", @person1.name)
        assert_equal(86, @person1.age)
    end

    def test_get_route_number()
        assert_equal(22, @bus.route_number)
        assert_equal("Ocean Terminal", @bus.destination)
    end

    def test_drive_works()
        assert_equal("Brum brum", @bus.drive())
    end

    def test_blank_array()
        assert_equal(0, @bus.how_many_passengers())
    end

    def test_pick_up()
        @bus.pick_up(@person2)
        assert_equal(1, @bus.how_many_passengers())
    end

    def test_drop_off()
        @bus.drop_off(@person2)
        assert_equal(0, @bus.how_many_passengers())
    end

    def test_empty_bus()
        @bus.empty_bus()
        assert_equal(0, @bus.how_many_passengers())
    end

    def test_queue_length()
        assert_equal(0, @bus_stop.queue_length())
    end

    def test_get_stop_name()
        assert_equal("Princess Street", @bus_stop.stop_name())
    end

    def test_add_to_queue()
        @bus_stop.add_to_queue(@person2)
        assert_equal(1, @bus_stop.queue_length())
    end

    def test_pick_up_from_stop()
        @bus_stop.add_to_queue(@person1) 
        @bus_stop.add_to_queue(@person2)
        assert_equal(2, @bus_stop.queue_length())
        @bus.pick_up_from_stop(@bus_stop)
        assert_equal(0, @bus_stop.queue_length())
        assert_equal(2, @bus.how_many_passengers())
    end
    
end