#############################
#### Flaviane L da Silva ####
#############################

### Teste de hipótese
## Passo 1 = Definir as hipóteses 
## Passo 2 = Definir a estatística adequada para julgar a hipótese H0
## Passo 3 = Denifir a região de rejeição de H0, usando o nível de significância alpha
## Passo 4 = Usar as informações da amostra para encontrar o valor observado (t_obs) da estatística
## Passo 5 = Concluir

## Passo 1 = Definir as hipóteses 
#           * Bilateral
#                H0 : mu == mu_0
#                H1 : mu != mu_0
#           * Unilateral à esquerda
#                H0: mu == mu_0
#                H1: mu < mu_0
#           * Unilateral à direita
#                H0: mu == mu_0
#                H1: mu > mu_0

## Passo 2 = Definir a estatística adequada para julgar a hipótese H0
#           * Teste unilateral à esquerda:
#              * Sobre a média com variância conhecida (sigma)
#                 * Hipótese{
#                     H0 : mu==mu_0
#                     H1 : mu < mu_0
#                   }
#                 * Estatística do teste: 
#                         * Z = (bar(X) - mu_0)/(sqrt(sigma^2/n)) ~ N(0,1)
#                 * Região crítica (alpha):  
#                         * Z_obs < -Z_T
#               * Sobre a média, com variância desconhecida (S² - variância amostral)
#                 * Hipótese{
#                     H0 : mu == mu_0
#                     H1 : mu < mu_0
#                   }
#                 * Estatística do teste: 
#                         * T = (bar(X) - mu_0)/(sqrt(S^2/n)) ~ N(0,1)
#                 * Região crítica (alpha):  
#                         * Z_obs < -Z_T
#
#           * Teste unilateral à direita:
#              * Sobre a média com variância conhecida (sigma) 
#                 * Hipótese{
#                     H0 : mu == mu_0
#                     H1 : mu > mu_0
#                   }
#                 * Estatística do teste: 
#                         * Z = (bar(X) - mu_0)/(sqrt(sigma^2/n)) ~ N(0,1)
#                 * Região crítica (alpha): 
#                         * Z_obs > Z_T
#               * Sobre a média, com variância desconhecida (S² - variância amostral)
#                 * Hipótese{
#                     H0 : mu == mu_0
#                     H1 : mu > mu_0
#                   }
#                 * Estatística do teste: 
#                         * T = (bar(X) - mu_0)/(sqrt(S^2/n)) ~ N(0,1)
#                 * Região crítica (alpha): 
#                         * Z_obs > Z_T
#           * Teste bilateral 
#              * Sobre a média com variância conhecida (sigma) 
#                 * Hipótese{
#                     H0 : mu == mu_0
#                     H1 : mu != mu_0
#                   }
#                 * Estatística do teste: 
#                         * Z = (bar(X) - mu_0)/(sqrt(sigma^2/n)) ~ N(0,1)
#                 * Região crítica (alpha): 
#                         * Z_obs < -Z_T ou Z_obs > Z_T
#               * Sobre a média, com variância desconhecida (S² - variância amostral)
#                 * Hipótese{
#                     H0 : mu == mu_0
#                     H1 : mu != mu_0
#                   }
#                 * Estatística do teste: 
#                         * T = (bar(X) - mu_0)/(sqrt(S^2/n)) ~ N(0,1)
#                 * Região crítica (alpha): 
#                         * Z_obs < -Z_T ou Z_obs > Z_T
#                         
## Passo 3 = Denifir a região de rejeição de H0, usando o nível de significância alpha
## Passo 4 = Usar as informações da amostra para encontrar o valor observado (t_obs) da estatística
## Passo 5 = Concluir


#### Erros do teste de hipótese
## Erro tipo I - Rejeitou H0, mas H0 é V (alpha)
## Erro tipo  II - Aceitou H0, mas H0 é F (beta)

#### Poder do teste
### pi = 1 - beta

#### Teste p está presente em diversos testes: teste t, teste de distribuição, ANOVA e análise de regressão
### Determina se o resultado do seu teste de hipóteses é estatisticamente significativo. Seus valores estão 
### associados à Hipótese nula (H0). Para p_valores altos, concluí-see que os resultados da amostra estão 
### consistentes com uma hipotése nula verdadeira. Para p-value baixo, concluí-se que os resultados da amostra 
### não são consistentes com a hipótese nula, caso esse valore seja pequeno o SUFICIENTE, pode-se concluir 
### que a amostra é tão incompatível com a hipótese nula que pode-se rejeitar H0 para toda a população
### Com os p-values, pode-se usar uma amostra para tirar conclusões sobre uma população. 
### Então, utiliza-se o erro tipo I (alpha) para comparar com p-value.
### Assim, o p-value é a probabilidae de observar uma estatística de amostra que é pelo menos tão extrema quanto
### a sua estatística quando vc assume que a hipótese nula é verdadeira (alpha)
### Se H0 for verdadeira, qual é a probabilidade de se obter um valor tão extremo quanto a esse, na estatística 
### de teste utilizada? O valor-p é a resposta, para tão observa-se a amostra dos dados

##### Exemplo

mu_0 = 3
sd = 2
n=10
x <- rnorm(n, mu_0, sd)

## Teste de hipótese
## Usando a biblioteca
# Conjunto de dados
set.seed(13)

tteste <- t.test(x,
                 mu=mu_0,    # H0: mu==mu_o
                 paired = F) # dados não pareados
tteste
## Interpretando o resultado:
# One Sample t-test
# data:  x                                            # conjunto de dados
# t = 2.7225,                                         # Resultado da estatística T (t_obs)
# df = 9,                                             # Grau de liberdade da distribuição T = Tamanho da amostra - 1 
# p-value = 0.02351                                   # Interpretação: dados que H0 é V, a probabilidade de se obter um valor
#                                                     # tão extremo quanto o resultado da estatística do teste (t) é
#                                                     # muito baixo, logo é pouco provável que a média dos dados seja 3.
#                                                     # então rejeita-se H0.
#                                                     # Esse resultado é contraditório, pois é sabido que mu=3, porém
#                                                     # os dados gerados com a semente (13) induzem a negar a hipotése nula
#                                                     # aumentando o valor de n, esse resultado mudará.
#                                                     # Se realizarmos 100 vezes esse experimento, apenas 5% das resultará 
#                                                     # na rejeição de H0: mu==mu_0.
# alternative hypothesis: true mean is not equal to 3 # H1: mu != 3
# 95 percent confidence interval:
#  3.202926 5.197290                                  # intervalo de confiança
# sample estimates:
#  mean of x 
# 4.200108                                            # média dos dados gerados

#### mudando a semente
set.seed(133)
xx <- rnorm(n,mu.0,sd)
tteste <- t.test(xx,mu=3, paired = F)
tteste

# One Sample t-test
# data:  x
# t = 0.214
# df = 9
# p-value = 0.8353                                       # Interpretação: dado que H0 é V, a probabilidade de se obter um valor 
#                                                        # tão extremo quanto o resultado da estatística de teste (t) é muito alta
#                                                        # logo, é provável que mu.0=3, então não se rejeita a hipótese nula.
# alternative hypothesis: true mean is not equal to 3
# 95 percent confidence interval:
#   2.007396 4.200029
# sample estimates:
#   mean of x 
# 3.103713 


##### Sem biblioteca
# Hipóteses
# H0: mu==mu_0
# H1: mu != mu_0 # bilateral

xb <- mean(x)                                         # média amostral (bar(X))
var.x <- var(x)                                       # variância amostral (s²)
sd.x <- sd(x)                                         # desvio padrão amostral
n.x <- length(x)                                      # tamanho amostral

alpha <- 0.05                                         # Nível de significância do este
# Região de rejeição para H1: mu != mu_0 (Teste bilateral)
print(alpha/2)                                        # quantil 2.5 %                                        
print(1-alpha/2)                                      # quantil 97.5 %

quantis_t = c(qt(alpha/2,n-1),qt(1-alpha/2,n-1))      # quantis da distribuição t

IC95 <- xb + sd.x/sqrt(n.x)*quantis_t                 # intervalo de confiânça (media - sd/sqrt(n)) e (media+sd/sqrt(n))
print(IC95)                                           # resultado 

mu.0 <-3 

# estatística do teste, para média com variância desconhecida
t.obs <- (xb-mu.0)/(sd.x/sqrt(n))                     # t_obs

#probabilidade de que o valor da estatística observada na amostra ser maior que t.obs
pt(t.obs, n.x - 1, lower = F)                   # probabilidade de uma T-Student com n-1 graus de liberdade
                                                # probabilidade do t.obs estar maior que 
valor.P <-2*pt(t.obs, n.x-1, lower = F)        # teste bilateral
valor.P

#### Graficamente
par(mfrow=c(2,2))
plot(x,dnorm(x,3,2), xlim=c(-2.2,6), pch=19,col="blue")
rug(x,col = 'blue', lwd=2)
plot(xx,dnorm(xx,3,2), xlim=c(-2.2,6), pch=19,col="red")
rug(xx,col = 'red', lwd=2)

plot(x,dnorm(x,3,2),xlim=c(-2.2,6),pch=19,col="blue")
rug(x,col = 'blue',lwd=2)
points(xx,dnorm(xx,3,2),pch=20,col='red')
rug(xx,col='red',lwd=3)

# comentários:
# Com os gráficos, é possível notar que os dados gerados com a semente 13 não apresentam bem o comportamento
# de uma distribuição normal (grafico vermelho), com tudo, para a outra semente utilizada (133), os
# dados gerados conseguiram representar melhor uma distribuição normal




###### Teste bilateral sobre a média com variância desconhecida
##### Hipóteses:
#### {
####   H0: mu==mu_0
####   H1: mu!=mu_0
#### }
##### A estatística de teste
#### T = (bar(x)-mu_o)/(sqrt(S²/n)) ~ t_n-1 (T-Student com n-1 graus de liberdade)
##### Decisão
#### Rejeite H_0 se t_obs < -t_T ou t_obs > t_T


par(mfrow=c(1,1))
tteste <- NULL #variavel para armazenar os valores obtidos no teste
nind <- 1000               # qtd de loop
n <- 10                    # tamanho amostral
for (i in 1:nind){
  x <- rnorm(n,3,2)        # gerando um vetor de dados
  tteste[i] <-t.test(x,mu=3,paired = F)$p.value # realizando o teste.t e salvando o p-value
}

plot.ts(1:nind, tteste, col='lightblue', type='l', # plotando todos os p-value obtidos
        xlab="Amostra",ylabe='p-value')
points(1:nind, tteste, col='lightblue',pch=19)     # marcando os pontos
abline(h=0.05, col='blue',lwd=3)                   # linha para demarcar ensaios que obtiveram menos de 5%
ind <- tteste < 0.05                               # Verificando se o resultado está abaixo de 5%
cont <- sum(match(ind, "TRUE"), na.rm = TRUE)      # contando esses resultados
cont/nind                                          # proporção ds testes abaixo de 5% com o total simulado
summary(tteste)                                    # resumo


### comentários:
## observa-se que nesse caso, o mesmo tamanho amostral, a mesma média e o desvio padrão, foram usados
## na geração da amostra, contudo, os valores-p obtidos mudaram, assim, pode-se concluir que o valor-p
## depende da amostra, ou seja, a decisão de aceitar ou rejeitar H0, depende estritamente do conjunto de 
## dados utilizado no  teste de hipótese.
## da amostra utilizada. 


par(mfrow=c(2,2))
n = c(10,30,100,1000)

for (idx in 1:length(n_amostral)){
  tteste <- NULL  # variavel para armazenar os valores obtidos no teste
  nind <- 1000                   # qtd de loop
  #n <- 10                    # tamanho amostral
  for (i in 1:nind){
    x <- rnorm(n[idx],3,2)        # gerando um vetor de dados
    tteste[i] <-t.test(x,mu=3,paired = F)$p.value # realizando o teste.t e salvando o p-value
  }
  
  plot.ts(1:nind, tteste, col='lightblue', type='l', # plotando todos os p-value obtidos
          xlab="Amostra",ylabe='p-value', main = n[idx])
  points(1:nind, tteste, col='lightblue',pch=19)     # marcando os pontos
  abline(h=0.05, col='blue',lwd=3)                   # linha para demarcar ensaios que obtiveram menos de 5%
#  ind <- tteste < 0.05                               # Verificando se o resultado está abaixo de 5%
#  cont <- sum(match(ind, "TRUE"), na.rm = TRUE)      # contando esses resultados
#  cont/nind                                          # proporção ds testes abaixo de 5% com o total simulado
#  summary(tteste)                                    # resumo
  
}




##### Probabilidade do Erro tipo I
# P[Rejeitar H_0|H_0 é V] = P[Rejeitar H_0|mu=500] = 0,05
# Para o teste bilateral H_1: mu!=mu_0, assim a região crítica será
# t_obs < q_1  ou t_obs > q_2
# Neste exemplo, a amostra tem 226
n=226
q1 <- qt(0.025, n-1) # quantil 1 da Distribuição T-Student
q2 <- qt(0.975, n-1) # quantil 2 da Distribuição T-Student
# a regição de aceitação de H_0 é (q1,q2)
# A P[Aceitar H_0|mu = mu_0]=0.95, logo P[erro T2]= beta = 0.95
# poder = 1- beta = 1- 0.95 = 0.05 = P[erro T1]

## Calculo do erro T2
# beta = P[Aceitar H_0 | H_0 é Falso] = P[Aceitar H_0 | mu != mu_0]
# Demonstração
# https://drive.google.com/file/d/1CzBySWFY0JPUgierzUKe66o7qqJH73YS/view

n <- 226
delta <- 1
dp<-s <- sqrt(262.56)
q1 <- -1.971-delta/(dp/sqrt(226))
q2 <- 1.971-delta/(dp/sqrt(226))
beta <- pt(q2,n-1)-pt(q1,n-1)
poder<-1-beta
data.frame(beta=beta,poder=poder)

power.t.test(n=n,delta=1,sd=s,sig.level=0.05,
             type="one.sample",
             alternative="two.sided",
             strict = TRUE)
# único Delta
power.t.test(n=n,delta=-2,
             sd=s,sig.level=0.05,
             type="one.sample",
             alternative="two.sided",
             strict = TRUE)

# Vários deltas
res <- power.t.test(n=n,delta=seq(-5,5,1),
                    sd=s,sig.level=0.05,
                    type="one.sample",
                    alternative="two.sided",
                    strict = TRUE)

names(res)
data.frame(delta=seq(-5,5,1),beta=1-res$power,poder=res$power)
par(mfrow=c(1,1))
plot(500+seq(-5,5,1),res$power,type="l")

# n=226
res <- power.t.test(n=n,delta=seq(-10,10,0.5),
                    sd=s,sig.level=0.05,
                    type="one.sample",
                    alternative="two.sided",
                    strict = TRUE)
plot(500+seq(-10,10,0.5),res$power,type="l")

# n=50
res <- power.t.test(n=50,delta=seq(-10,10,0.5),
                    sd=s,sig.level=0.05,
                    type="one.sample",
                    alternative="two.sided",
                    strict = TRUE)

lines(500+seq(-10,10,0.5),res$power,type="l",
      lty=2,col="red")
