module Square
  # CustomerSegmentsApi
  class CustomerSegmentsApi < BaseApi
    def initialize(config, http_call_back: nil)
      super(config, http_call_back: http_call_back)
    end

    # Retrieves the list of customer segments of a business.
    # @param [String] cursor Optional parameter: A pagination cursor returned by
    # previous calls to __ListCustomerSegments__. Used to retrieve the next set
    # of query results.  See the [Pagination
    # guide](https://developer.squareup.com/docs/working-with-apis/pagination)
    # for more information.
    # @return [ListCustomerSegmentsResponse Hash] response from the API call
    def list_customer_segments(cursor: nil)
      # Prepare parameters.
      _parameters = {
        'cursor' => cursor
      }

      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/segments'
      _query_builder = APIHelper.append_url_with_query_parameters(
        _query_builder,
        _parameters
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end

    # Retrieves a specific customer segment as identified by the `segment_id`
    # value.
    # @param [String] segment_id Required parameter: The Square-issued ID of the
    # customer segment.
    # @return [RetrieveCustomerSegmentResponse Hash] response from the API call
    def retrieve_customer_segment(segment_id:)
      # Prepare parameters.
      _parameters = {
        'segment_id' => { 'value' => segment_id, 'encode' => true }
      }

      # Prepare query url.
      _query_builder = config.get_base_uri
      _query_builder << '/v2/customers/segments/{segment_id}'
      _query_builder = APIHelper.append_url_with_template_parameters(
        _query_builder,
        _parameters
      )
      _query_url = APIHelper.clean_url _query_builder

      # Prepare headers.
      _headers = {
        'accept' => 'application/json'
      }

      # Prepare and execute HttpRequest.
      _request = config.http_client.get(
        _query_url,
        headers: _headers
      )
      OAuth2.apply(config, _request)
      _response = execute_request(_request)

      # Return appropriate response type.
      decoded = APIHelper.json_deserialize(_response.raw_body)
      _errors = APIHelper.map_response(decoded, ['errors'])
      ApiResponse.new(
        _response, data: decoded, errors: _errors
      )
    end
  end
end
