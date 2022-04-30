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
#              * Sobre a média com variância conhecida 
#                 * Hipótese{
#                     H0 : mu==mu_0
#                     H1 : mu < mu_0
#                   }
#                 * Estatística do teste: 
#                         * Z = (bar(X) - mu_0)/(sqrt(sigma^2/n)) ~ N(0,1)
#                 * Região crítica (alpha):  
#                         * Z_obs < -Z_T
#               * Sobre a variância com média conhecida
#                 * Hipótese{
#                     H0 : sd == sd_0
#                     H1 : sd < sd_0
#                   }
#                 * Estatística do teste: 
#                         * T = (bar(X) - mu_0)/(sqrt(S^2/n)) ~ N(0,1)
#                 * Região crítica (alpha):  
#                         * Z_obs < -Z_T
#
#           * Teste unilateral à direita:
#              * Sobre a média com variância conhecida 
#                 * Hipótese{
#                     H0 : mu == mu_0
#                     H1 : mu > mu_0
#                   }
#                 * Estatística do teste: 
#                         * Z = (bar(X) - mu_0)/(sqrt(sigma^2/n)) ~ N(0,1)
#                 * Região crítica (alpha): 
#                         * Z_obs > Z_T
#               * Sobre a variância com média conhecida
#                 * Hipótese{
#                     H0 : sd == sd_0
#                     H1 : sd > sd_0
#                   }
#                 * Estatística do teste: 
#                         * T = (bar(X) - mu_0)/(sqrt(S^2/n)) ~ N(0,1)
#                 * Região crítica (alpha): 
#                         * Z_obs > Z_T
#           * Teste bilateral 
#              * Sobre a média com variância conhecida 
#                 * Hipótese{
#                     H0 : mu == mu_0
#                     H1 : mu != mu_0
#                   }
#                 * Estatística do teste: 
#                         * Z = (bar(X) - mu_0)/(sqrt(sigma^2/n)) ~ N(0,1)
#                 * Região crítica (alpha): 
#                         * Z_obs < -Z_T ou Z_obs > Z_T
#               * Sobre a variância com média conhecida
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
set.seed(13)
mu_0 = 3
sd = 2
n=10
x <- rnorm(n, mu_0, sd)
x

## Teste de hipótese
tteste <- t.test(x,mu=mu_0, paired = F)
tteste
## resultado
#One Sample t-test
# data:  x                                    # conjunto de dados
# t = 2.7225,                                 # Resultado da estatística T
# df = 9,                                     # Grau de liberdade = Tamanho da amostra - 1 
# p-value = 0.02351                           # a probabilidade de se obter 
# alternative hypothesis: true mean is not equal to 3
# 95 percent confidence interval:
#  3.202926 5.197290
# sample estimates:
#  mean of x 
# 4.200108 

