class ClientController < ApplicationController
  def ask
    if params[:value].present?
      response = LangchainClient.instance.vector_search.ask(question: params[:value])
      raw_response = response.raw_response
      @message = raw_response["choices"][0]["message"]["content"]
      @json_response = JSON.pretty_generate(raw_response)
    end
  end
end
