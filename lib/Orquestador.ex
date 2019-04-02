defmodule Orquestador do

  def manager(arg, file_adress) do

    file_content= File.read!(file_adress); ##lectura del archivo
    tokens_separados =  Lexer.scan_word(file_content); #generación de Tokens
    ast = Parser.parsero(tokens_separados); #generación del árbol
    ensamblador=Generador_codigo.assembly(ast); #generación del código

    case arg do
      "-t" -> IO.inspect(tokens_separados);
      "-a" -> IO.inspect(ast);
      "-s" -> IO.inspect(ensamblador)
      "--debug" -> IO.inspect(tokens_separados)
                   IO.inspect(ast);
                   IO.puts(ensamblador)
      nil -> :ok
    end

  end
end
