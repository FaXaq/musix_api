defmodule Musix.NoteTest do
  use ExUnit.Case
  use Musix.Note

  @valid_notes ["Ab","A","As","Bb","B","C","Cs","Db","D","Ds","Eb","E","F","Fs","Gb","G","Gs"]

  test "Can get all notes" do
    #check if get_notes retrieves a list
    assert(is_list(get_notes()))

    #check if get_notes retrieves the list of valid notes
    assert(get_notes() === @valid_notes)
  end

  test "Get note index in list" do
    case get_note_index("A") do
      {:ok, x} ->
        assert x === 1
      _ ->
        assert false
    end
  end

  test "Get note alias" do
    case get_note_alias("G") do
      note ->
        assert(note === "G")
    end
  end

  test "Sharpen note" do
    case get_sharpened_note("Gb") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "G")
    end

    case get_sharpened_note("G") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "Gs")
    end

    case get_sharpened_note("Fs") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "G")
    end

    case get_sharpened_note("Gs") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "A")
    end
  end

  test "Flatten note" do
    case get_flattened_note("Ab") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "G")
    end

    case get_flattened_note("A") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "Ab")
    end

    case get_flattened_note("Gs") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "G")
    end

    case get_flattened_note("Db") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "C")
    end
  end

  test "get a perfect fifth" do
    case get_perfect_fifth("C") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "G")
    end
  end

  test "get a major third" do
    case get_major_third("C") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "E")
    end
  end

  test "get a minor third" do
    case get_minor_third("C") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "Ds")
    end
  end

  test "get a augmented fifth" do
    case get_augmented_fifth("Cs") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "A")
    end
  end

  test "get a diminished fifth" do
    case get_diminished_fifth("C") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "Fs")
    end
  end

  test "get a minor seventh" do
    case get_minor_seventh("Fs") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "E")
    end
  end

  test "get a major seventh" do
    case get_major_seventh("Fs") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "F")
    end
  end

  test "get a diminished seventh" do
    case get_diminished_seventh("Fs") do
      {atom, note} ->
        assert(atom == :ok)
        assert(note === "Ds")
    end
  end

  test "get semi-tones between" do
    case get_semi_tones_between("A","As") do
      x ->
        assert(x === 1)
    end

    case get_semi_tones_between("A","Ab") do
      x ->
        assert(x === 11)
    end
  end
end