class ClientController < ApplicationController
  def ask
    if params[:value].present?
      client = LangchainClient.instance
      response = client.vector_search.ask(question: params[:value])
      @raw_response = response.raw_response
    end
  end
end
