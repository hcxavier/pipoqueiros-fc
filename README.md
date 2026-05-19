# pipoqueiros-fc

### 🎨 Design Tokens - Cores (Mobile)

As cores do aplicativo Pipoqueiros FC foram divididas em categorias semânticas para facilitar a manutenção e garantir consistência na interface de usuário (UI).

#### 1. Cores da Marca (Brand Colors)

Cores principais que representam a identidade visual do aplicativo.

| Token            | Hex/RGBA  | Descrição                                                                      |
| :--------------- | :-------- | :----------------------------------------------------------------------------- |
| `brandYellow`    | `#F7DD43` | Cor primária da marca (amarelo principal).                                     |
| `brandYellowAlt` | `#FFCC00` | Variação alternativa do amarelo da marca.                                      |
| `yellowPrimary`  | `#F7DD43` | Alias para a cor principal, muito utilizada para destaques e botões primários. |

#### 2. Planos de Fundo e Superfícies (Backgrounds)

Utilizadas para o fundo de telas, cards, modais e estados de erro. O app segue um tema predominantemente escuro (Dark Mode).

| Token                         | Hex/RGBA  | Descrição                                                                                  |
| :---------------------------- | :-------- | :----------------------------------------------------------------------------------------- |
| `scaffoldDarkBackgroundColor` | `#05050D` | Cor de fundo raiz do aplicativo (Scaffold).                                                |
| `bgPrimary`                   | `#121214` | Cor de fundo primária para containers base.                                                |
| `bgSecondary`                 | `#202024` | Fundo secundário, utilizado para elevar elementos sobre o fundo primário (ex: cards).      |
| `bgTertiary`                  | `#29292E` | Fundo terciário, para elementos ainda mais destacados na hierarquia (ex: modais, pop-ups). |
| `bgDark`                      | `#1E1E1E` | Superfície escura genérica.                                                                |
| `bgLight`                     | `#192922` | Superfície com tom levemente esverdeado (ex: sucesso, estados positivos).                  |
| `bgSecondaryButton`           | `#292619` | Cor de fundo para botões secundários ou de estado com tom amarelado/sépia.                 |
| `bgError`                     | `#291719` | Cor de fundo para mensagens, banners ou cards de erro/alerta.                              |

#### 3. Bordas e Divisores (Borders & Dividers)

Servem para delimitar áreas, separar itens em listas ou criar hierarquia visual em componentes.

| Token             | Hex/RGBA           | Descrição                                                             |
| :---------------- | :----------------- | :-------------------------------------------------------------------- |
| `borderPrimary`   | `#323238`          | Cor principal para contornos, divisórias leves e bordas de cards.     |
| `borderSecondary` | `#121214`          | Borda mais escura, geralmente usada para fundir com o fundo primário. |
| `borderInput`     | `rgba(58,60,70,1)` | Bordas específicas para campos de formulário e inputs.                |

#### 4. Tipografia e Textos (Text Colors)

Sistema de cores para garantir boa legibilidade e hierarquia da informação textual no tema escuro.

| Token           | Hex/RGBA  | Descrição                                                                    |
| :-------------- | :-------- | :--------------------------------------------------------------------------- |
| `textPrimary`   | `#FFFFFF` | Texto com maior destaque (Títulos, textos principais).                       |
| `textSecondary` | `#E1E1E6` | Texto secundário (Corpo de texto padrão).                                    |
| `textTertiary`  | `#C4C4CC` | Texto terciário (Legendas, informações de apoio).                            |
| `textMuted`     | `#8D8D99` | Texto desativado ou detalhes sutis (Helpers).                                |
| `textGray`      | `#938F96` | Variação de cinza para textos neutros (ex: opções).                          |
| `textDark`      | `#71717B` | Texto escuro, focado em elementos de contraste menor.                        |
| `textBlack`     | `#09090A` | Textos em cima de fundos claros ou brand (ex: texto preto no botão amarelo). |
| `textInput`     | `#BCBCBC` | Cor da fonte para o valor digitado nos campos de formulário.                 |
| `textError`     | `#FF383C` | Texto de erro, alertas de validação e feedback negativo.                     |

#### 5. Componentes Específicos

Cores mapeadas estritamente para um componente isolado.

| Token              | Hex/RGBA            | Descrição                                                                 |
| :----------------- | :------------------ | :------------------------------------------------------------------------ |
| `surfaceInput`     | `#292B3D`           | Cor de preenchimento (fundo) de campos de digitação (Inputs).             |
| `avatarBackground` | `rgba(43,39,116,1)` | Fundo padrão para componentes de avatar (imagem de usuário indisponível). |

#### 6. Cores Base (Base / Neutras)

Cores primitivas absolutas para uso atípico ou herança.

| Token   | Hex/RGBA  | Descrição    |
| :------ | :-------- | :----------- |
| `white` | `#FFFFFF` | Branco puro. |
| `black` | `#000000` | Preto puro.  |
