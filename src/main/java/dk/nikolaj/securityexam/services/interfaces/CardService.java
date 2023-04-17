package dk.nikolaj.securityexam.services.interfaces;

import dk.nikolaj.securityexam.entities.Card;

import java.util.List;

public interface CardService {

    List<Card> listAllCards();

    Card getCard(Long id);

    void saveCard(Card card);

    void deleteCard(Long id);
}
