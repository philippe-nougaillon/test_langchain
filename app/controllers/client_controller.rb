class ClientController < ApplicationController
  def ask
    if params[:value].present?
      llm = Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"])
      client = Langchain::Vectorsearch::Pgvector.new(index_name: "Documents", url: "postgresql://langchain_user:langchain_pwd@localhost/test_langchain_development", llm: llm)
      response = client.ask(question: params[:value])
      @raw_response = response.raw_response
    end
  end
end
