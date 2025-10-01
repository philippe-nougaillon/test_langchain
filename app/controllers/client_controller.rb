class ClientController < ApplicationController
  before_action :init_langchain_client

  def ask
    if params[:value].present?
      response = @langchain_client.ask(question: params[:value])
      @raw_response = response.raw_response
    end
  end

private
  def init_langchain_client
    llm = Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"])
    @langchain_client = Langchain::Vectorsearch::Pgvector.new(index_name: "Documents", url: "postgresql://langchain_user:langchain_pwd@localhost/test_langchain_development", llm: llm)
  end
end
