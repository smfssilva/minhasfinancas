package com.smfssilva.minhasfinancas.Exception;

public class ErroAutenticacao extends RuntimeException{
	private static final long serialVersionUID = 1L;
	
	public ErroAutenticacao(String mensagem) {
		super(mensagem);
	}

}
