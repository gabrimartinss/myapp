class ProdutosController < ApplicationController

    before_action :set_produto, only:[:edit, :destroy, :update]
    
    def index
        @produtos = Produto.order(nome: :desc).limit 5
        @produto_com_desconto  = Produto.order(:preco).limit 1  
    end

    def new
        @produto = Produto.new
        @depatamentos = Departamento.all
    end

    def show
        @produto = Produto.where "id = ?", set_produto
    end
    

    def edit
        renderiza :edit
    end

    def update
        if @produto.update protudo_params
            flash[:notice] = "Produto atualizado com sucesso !"
            redirect_to root_url
        else
            flash[:notice] = "Error produto não foi atualizado !"
            renderiza :edit
        end
    end

    def create
        @produto = Produto.create protudo_params
        if @produto.save
            flash[:notice] = "Produto \"#{@produto.nome}\" salvo com suceso !"
            redirect_to(root_url)
        else
            renderiza :new
        end
    end

    def destroy
        @produto.destroy
        redirect_to root_url
    end

    def busca
        @nome = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome}%"
    end

    def protudo_params
       params.require(:produto).permit(:nome, :descricao, :preco, :quantidade, :departamento_id) 
    end

    def set_produto
        @produto = Produto.find(params[:id])
    end

    def renderiza view
        @depatamentos = Departamento.all
        render view
    end

end
