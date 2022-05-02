#Considere que uma indústria compra de um certo fabricante, pinos cuja resistencia
# meia à ruptura é 60 kgf. Qual teste deve ser realizado para veficar um lote recebido?
#resp: Faria um teste de hipótese bilateral com os seguintes passos:
# passo 1: as hipóteses {H_0: mu==mu_0, H_1: mu != mu_0} Bilateral
# passo 2: A estatístca de teste, não foi dada a variância 
# 
# No exemplo do endocrinologista, busca-se saber se o tratamento reduziu peso, logo
# o teste de hipótese vai buscar verificar se {H_0: mu==mu_0, H_1: mu<mu_o} bilateral a esquerda
# porém nesse caso, as estatísticas media e desvio p, eram da população, não da amostra
# 
# No exemplo do comprador que suspeita da redução na qualidade dos tijolos, a resistencia média
# era 200 kg, com 10kg de desvio padrão, ele pegou uma amostra com 100 tijolos (n),
# e a media amostral = 195. Ao nível de significância de 5% (erro tipo I, probabilidade de rejeitar H_0
# dados que H_0 é V), pode se afirmar que a resistência média diminuiu?
# nesse caso, o teste é unilateral a esquerda com as hipoteses {H_0: mu==mu_0, H_1:mu<mu_0}
# como se tem o desvio padrão, a estatistica usada é uma Z=(195-200)/(10/sqrt(100)) ~ N(0,1),
# como o teste é unilateral, então usasse o quantil da normail de 5% (qnorm(0.05)) que será negativo

## Quando a variância é conhecida usa-se o teste Z, na prática não se conhece a variabilidade, então usa-se 
## o teste t

### Comparação de média de dois tratamentos X e Y, antes era teste para uma única média
## Dados não pareados: são dados independentes, não precisam ter o mesmo tamanho amostral, há dois cenários:
## * variabilidades desconhecidas e iguais:
## * variabilidades desconhecidas e diferentes:

### Passo 1: Definir Hipoteses:
## * unilateral: esquerda => {H_0: mu_X=mu_y, H_0: mu_X<mu_y}         Tamanho amostral de X é n
## * unilateral: direita => {H_0: mu_X=mu_y, H_0: mu_X>mu_y}          Tamanho amostral de Y é m
## * Biilateral => {H_0: mu_X=mu_y, H_0: mu_X != mu_y}
### Passo 2: Escolher a estatística adequada para julgar a hipótese H_0,
## * Variância desconhecidas (não se conhece a variância populacional) e iguais: sigma²_x = sigma²_y = sigma²
##    Neste caso a estatística do teste será: T = (bar(x)-bar(y))/(sqrt(S²_p(1/n + 1/m))) ~ t_n+m-2 (graus de liberdade)
##    onde, S²_p = ((n-1)S²_X + (m-1)S²_Y)/(n+m-2) é a variância comum às duas populações
## * Variância desconhecidas (não se conhece a variância populacional) e diferentes: sigma²_x != sigma²_y != sigma² 
##    Neste caso a estatística do teste será: T=(bar(X)-bar(Y))/(sqrt(S²_X/n + S²_Y/m)) ~ t_v
##    onde v = (S²_X/n + S²_y/m)²/((S²_X/n)²/(n-1) + (S²_Y/m)²/(m-1))
## Obs.: para verificar se a escolha da variância está correta, é preciso fazer um teste de hipótese também.
### Passo 3: fixar o nível de significância do teste e a região crítica, onde se rejeita H_0
### Passo 4: Usar a informação da amostra para encontrar o valor observado (t_obs) da estatística
### Passo 5: Concluir: Se t_obs pertence a região crítica, nesse caso rejeia H_0, caso contrário não há evidências 
##           ao nível de significância alpha para rejeitar a hipótese nula.
## Calculando o valor-P, que é a probabilidade de rejeitar H_0, dado que H_0 é verdadeira, se valor-P < alpha, rejeita H_0

### Dados pareados: são dados dependentes (antes e depois)
# Considerando a amostra de pares (X1,Y1), (X2,Y2),...,(Xn,Yn), fazendo D=X-Y, temos que um a.a D1,D2,...,Dn (são independentes)
# As hipóteses: bilateral ou unilateral a esquerda ou unilateral a direita...
# A estatística do teste será: T=(bar(D)-mu_D)/sqrt(S²_D/n) ~ t_n-1, com mu_d = mu_x -mu_y
# nivel de significância e a Região crítica
# t_obs das amostras
# concluir

## Exemplo de conjunto de dados não pareados com tamanho amostral diferente

A <-c(15,16,13,11,12,15)
n<- length(A)
B<- c(17,16,15,17,18,15,14)
m<-length(B)
                # id dos grupos A e B
dados <-data.frame(trat=c(rep(1,n),rep(2,m)), #coluna com a identificação do tratamento
                   peso=c(A,B))# coluna com os pesos
dados$trat
dados$peso
dados$trat <- as.factor(dados$trat)
str(dados)

##3 visualizações
boxplot(dados$peso ~ dados$trat, 
        xlab = 'Tratamento',
        ylab='Peso(g)',
        col='lightblue') # fazer por estudos
# resultado, aparetemente os tratamentos difere entre si 

require(lattice)
dotplot(dados$peso ~ dados$trat)
 
## Teste de homogeneidade de variâncias de
## Teste de Bartlett
### Usado para verificar se as variâncias desconhecidas são iguais ou diferentes,
## com esse resultado é possível decidir as hipoteses, pois já se sabe se como as variâncias são,
## e assim também o teste de comparação de médias
bartlett.test(dados$peso ~ dados$trat)

# Conclusão: p_value=0,4609 indica que o valor dessa estatísta, tão extremo quanto ao obtido, 
# é muito provavel de ocorrer, logo as variâncias são iguais, então não rejeitamos H0

## como avaliar o p-value > alpha: se H_0 é V, é muito provavel obter um valor tão extremo quanto o obtido 
# na estatística, logo aceita-se H_0

## como avaliar o p-value < alpha: se H_0 é V, é pouco provavel obter um valor tão extremo quanto o obtido 
# na estatística, logo rejeita-se H_0


### Teste de comparação de média

t.test(dados$peso ~ dados$trat, 
       var.equal = T) #variancias iguais (default é F, usaria essa se rejeitasse H0 no teste bartlett)
                      #
# Interpretação do p-value: se H_0 for verdadeira, é muito pouco provavel obter o valor da estatística t(t_obs),
# não há evidencia para aceitar H_0