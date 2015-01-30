class NotesController < ActionController::Base

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    @note = Note.new(params)
    @note.save
    render json: @note
  end

  def show
    @note = Note.find(params[:id])
    render json: @note
  end

  def update
    @note = Note.find(params[:id])
    @note.update(params.require(:note).permit(:title, :body))
    render json: @note
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
  end

  private

  def params
    params.require(:note).permit(:title, :body)
  end

end
