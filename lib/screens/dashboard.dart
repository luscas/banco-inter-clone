import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:bancointer/data/user.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  bool currencyStatus = true;
  bool cardExpanded = false;

  handleCurrencyStatus() {
    setState(() {
      currencyStatus = !currencyStatus;
    });
  }

  handleCardExpanded() {
    setState(() {
      cardExpanded = !cardExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size dimensions = MediaQuery.of(context).size;
    User user = new User();

    return Scaffold(
      body: Container(
        width: dimensions.width,
        height: dimensions.height,
        color: Color(0xFFF5F6FA),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Cabeçalho
              Container(
                padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 25.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.center,
                    end: FractionalOffset.topRight,
                    colors: [
                      Color(0xFFFA4805),
                      Color(0xFFF17809),
                    ]
                  )
                ),
                child: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Saldo em conta', style: TextStyle(fontSize: 13.0, color: Colors.white.withOpacity(0.70))),
                              SizedBox(height: 5.0),
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        transform: Matrix4.translationValues(0, currencyStatus ? 0 : -10, 0),
                                        child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 300),
                                          opacity: currencyStatus ? 1.0 : 0.0,
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'R\$ ',
                                              style: TextStyle(fontSize: 16.0, color: Colors.white.withOpacity(0.70)),
                                              children: [
                                                TextSpan(
                                                  text: user.currency, style: TextStyle(fontSize: 18.0, color: Colors.white)
                                                )
                                              ]
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        transform: Matrix4.translationValues(0, currencyStatus ? -10 : 0, 0),
                                        child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 300),
                                          opacity: currencyStatus ? 0.0 : 1.0,
                                          child: Container(
                                              width: 80.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withOpacity(0.40),
                                                borderRadius: BorderRadius.circular(30.0)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: InkWell(
                                      onTap: () => handleCurrencyStatus(),
                                      child: Icon(currencyStatus ? FeatherIcons.eye : FeatherIcons.eyeOff, size: 20.0, color: Colors.white)
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 5.0),
                              Text('Atualizado nesse momento', style: TextStyle(fontSize: 13.0, color: Colors.white.withOpacity(0.70))),
                              SizedBox(height: 18.0),

                              Row(
                                children: [
                                  Container(
                                    width: 20.0,
                                    height: 2.0,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5.0),
                                  Container(
                                    width: 20.0,
                                    height: 2.0,
                                    color: Colors.white24,
                                  ),
                                ],
                              )
                            ],
                          ),

                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(user.avatar)
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Opções
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                constraints: BoxConstraints(
                  maxHeight: cardExpanded ? dimensions.height : 116.0,
                ),
                child: Transform(
                  transform: Matrix4.translationValues(0, -20, 0),
                  child: Wrap(
                    runSpacing: 15.0,
                    spacing: 15.0,
                    children: [
                      OptionCard(icon: FeatherIcons.refreshCw, name: 'Transferências'),
                      OptionCard(icon: FeatherIcons.maximize, name: 'Pagamentos'),
                      OptionCard(icon: FeatherIcons.barChart, name: 'Investimentos'),
                      
                      OptionCard(icon: FeatherIcons.creditCard, name: 'Cartão'),
                      OptionCard(icon: FeatherIcons.gift, name: 'Gift Card'),
                      OptionCard(icon: FeatherIcons.shield, name: 'Seguros'),
                    ],
                  ),
                ),
              ),

              // Expandir Opções
              Transform(
                transform: Matrix4.translationValues(0, -20, 0),
                child: RawMaterialButton(
                  onPressed: () => handleCardExpanded(),
                  child: Icon(cardExpanded ? FeatherIcons.chevronUp : FeatherIcons.chevronDown, color: Color(0xFFFA4805))
                ),
              ),

              // Anúncios

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Empréstimo agora é 100% digital! 🎄', style: TextStyle(color: Color(0xFFFA4805), fontWeight: FontWeight.bold)),
                        SizedBox(height: 5.0),

                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: dimensions.width - 100,
                          ),
                          child: Text('Agora ficou mais fácil conseguir o seu Empréstimo Consignado! Você faz tudo pelo app. Confira os convênios disponíveis e aproveite!', style: TextStyle(color: Color(0xFF80828C)))
                        ),
                      ]
                    ),

                    IconButton(
                      onPressed: () => print('Fechar anúncio'),
                      icon: Icon(FeatherIcons.x, color: Color(0xFFFA4805))
                    )
                  ],
                ),
              )
            ]
          ),
        ),
      )
    );
  }

  Widget OptionCard({ IconData icon, String name }) {
    return Container(
      width: 110.0,
      height: 110.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            color: Colors.black12
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Container(
            width: 50.0,
            height: 50.0,
            margin: EdgeInsets.only(top: 15.0),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Icon(icon, color: Color(0xFFEA4F00))
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(name.toString(), style: TextStyle(fontSize: 13.0, color: Color(0xFF787A84))),
          ),
        ],
      ),
    );
  }
}