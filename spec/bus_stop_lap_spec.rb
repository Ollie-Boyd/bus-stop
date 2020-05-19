require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus')
require_relative('../person')

class BusStopTest < Minitest::Test

    def setup
        @bus = Bus.new(22, "Ocean Terminal")
        @person = Person.new("Harrison", 86)
    end

    def test_get_person_name_plus_age()
        assert_equal("Harrison", @person.name)
        assert_equal(86, @person.age)
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

end