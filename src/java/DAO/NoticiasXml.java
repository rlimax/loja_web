
package DAO;

import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


public class NoticiasXml {
ArrayList<String> noticia = new ArrayList<>();
    
    public ArrayList<String> noticias(){
        try {
            String fonte = "https://g1.globo.com/dynamo/tecnologia/rss2.xml";
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            
            factory.setNamespaceAware(false);
            factory.setValidating(false);
            
            URLConnection connection = new URL(fonte).openConnection();
            connection.addRequestProperty("Accept", "application/xml");
            
            Document doc = builder.parse(connection.getInputStream());
            doc.getDocumentElement().normalize();
            
            NodeList lista = doc.getElementsByTagName("title");
            NodeList link  = doc.getElementsByTagName("link");
            
            int tamanho = lista.getLength();
            
            for(int i = 0; i < tamanho; i++){
                Node noNoticia = lista.item(i);
                Node noLink    = link.item(i);
                if(noNoticia.getNodeType() == Node.ELEMENT_NODE){
                    Element elemento  = (Element) noNoticia;
                    Element elementol = (Element) noLink;
                    //String nomeno = elemento.getNodeName();
                    
                    if(i>=1&&i<8){
                        System.out.println(i-1+" - "+elemento.getTextContent()+" - "+elementol.getTextContent());
                        noticia.add("<a href='"+elementol.getTextContent()+"' target='_blank'>G1 - "+elemento.getTextContent()+"</a>");
                    }
                }
            }
            
        } catch (SAXException ex) {
            Logger.getLogger(NoticiasXml.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(NoticiasXml.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(NoticiasXml.class.getName()).log(Level.SEVERE, null, ex);
        }
        return noticia;
    }

}
