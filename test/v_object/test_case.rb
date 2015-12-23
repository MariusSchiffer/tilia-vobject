module Tilia
  module VObject
    class TestCase < Minitest::Test
      # This method tests wether two vcards or icalendar objects are
      # semantically identical.
      #
      # It supports objects being supplied as strings, streams or
      # Sabre\VObject\Component instances.
      #
      # PRODID is removed from both objects as this is often changes and would
      # just get in the way.
      #
      # CALSCALE will automatically get removed if it's set to GREGORIAN.
      def assert_v_obj_equals(expected, actual, message = '')
        get_obj = lambda do |input|
          input = input.readlines.join("\n") if input.respond_to?(:readlines)

          input = Tilia::VObject::Reader.read(input) if input.is_a?(String)

          unless input.is_a?(Tilia::VObject::Component)
            fail ArgumentError, 'Input must be a string, stream or VObject component'
          end

          input.delete('PRODID')
          if input.is_a?(Tilia::VObject::Component::VCalendar) && input['CALSCALE'].to_s == 'GREGORIAN'
            input.delete('CALSCALE')
          end
          input
        end

        expected = get_obj.call(expected)
        actual = get_obj.call(actual)

        assert_equal(
          expected.serialize,
          actual.serialize,
          message
        )
      end
    end
  end
end
