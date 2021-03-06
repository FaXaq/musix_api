defmodule Musix.Router do
  use Musix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug CORSPlug
    plug :accepts, ["json"]
  end

  scope "/", Musix do
    pipe_through :browser # Use the default browser stack
  end

  # Other scopes may use custom stacks.
  scope "/api/v1/", Musix do
    pipe_through :api

    get "/", PageController, :api_description

    get "/notes/", NoteController, :index
    get "/notes/flatten/:note", NoteController, :flatten
    get "/notes/sharpen/:note", NoteController, :sharpen

    get "/chords/", ChordController, :index

    get "/chords/:root/", ChordController, :get_all_chords
    get "/chords/:root/:chord", ChordController, :get

    get "/intervals", IntervalsController, :index
    get "/intervals/:root/:interval", IntervalsController, :get_interval

    get "/scales", ScaleController, :index
    get "/scales/:root/", ScaleController, :get_scales
    get "/scales/:root/:scale", ScaleController, :get

    get "/strings/positions/:root", StringsController, :get_positions_on_strings
    get "/strings/frets", StringsController, :get_fret_number
  end
end
