<?php

namespace App\Controller;

use App\Entity\Categorie;
use App\Entity\Album;
use App\Entity\Annonce;
use App\Form\AnnonceType;
use App\Form\AjouterType;
use App\Repository\AnnonceRepository;
use App\Repository\CategorieRepository;
use App\Repository\AlbumRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface as EntityManager;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

class AccueilController extends AbstractController
{
    /**
     * @Route("admin/accueil", name="accueil")
     * 
     */
    public function index(AlbumRepository $al, EntityManager $em, Request $rq,AnnonceRepository $ar)
    {
        $listeannonces = $ar->findAll();
    
        return $this->render("accueil/index.html.twig", compact("listeannonces"));
    }
    
    
    /**
     * @Route("/rechercher", name="rechercher")
     */
    
    public function recherche(CategorieRepository $cr, Request $rq) {
        $mot = $rq->query->get("search_word");
        $liste_categories = $cr->motsCles($mot);
        return $this->render("base.html.twig", compact("liste_categories"));
        
    }
}
