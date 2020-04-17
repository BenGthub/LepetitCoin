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



class AnnonceController extends AbstractController {

    /**
     * @Route("/", name="annonce_index", methods={"GET"})
     */
    public function index(AnnonceRepository $annonceRepository): Response {
        return $this->render('annonce/index.html.twig', [
                    'annonces' => $annonceRepository->findAll(),
        ]);
    }

    /**
     * @Route("/annonce/new", name="annonce_new", methods={"GET","POST"})
     */
    public function new(Request $request, AlbumRepository $al, EntityManager $em): Response {
        $annonce = new Annonce();
        $chargerPhoto = new Album();

        $form = $this->createForm(AnnonceType::class, $annonce);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $photo = $form->get("photo1")->getData();

            $nomFichier = pathinfo($photo->getClientOriginalName(), PATHINFO_FILENAME);
            $nomFichier .= uniqid();
            $nomFichier .= "." . $photo->getExtension();
            $nomFichier = str_replace(" ", "_", $nomFichier);
            // on enregistre le fichier téléchargé dans le dossier images
            $photo->move($this->getParameter("dossier_images"), $nomFichier);
            $em->flush();
            
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($annonce, $chargerPhoto);
            $entityManager->flush();

            return $this->redirectToRoute('accueil');
        }

        return $this->render('annonce/new.html.twig', [
                    'annonce' => $annonce,
                    'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/annonce/{id}", name="annonce_show", methods={"GET"})
     */
    public function show(Annonce $annonce): Response {
        return $this->render('annonce/show.html.twig', [
                    'annonce' => $annonce,
        ]);
    }

    /**
     * @Route("/annonce/{id}/edit", name="annonce_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Annonce $annonce): Response {
        $form = $this->createForm(AnnonceType::class, $annonce);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('annonce_index');
        }

        return $this->render('annonce/edit.html.twig', [
                    'annonce' => $annonce,
                    'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/annonce/{id}", name="annonce_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Annonce $annonce): Response {
        if ($this->isCsrfTokenValid('delete' . $annonce->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($annonce);
            $entityManager->flush();
        }

        return $this->redirectToRoute('annonce_index');
    }
    
    

    

    /**
     * @Route("/membre/annonce/ajouter", name="Page_Annonce", methods={"GET", "POST"})
     */
    public function ajouter(AlbumRepository $al, EntityManager $em, Request $rq,AnnonceRepository $ar) {
        $annonce = new Annonce();
        $chargerPhoto = new Album;
        
        $formAjouter = $this->createForm(AjouterType::class, $annonce);
        $formAjouter->handleRequest($rq);
        if ($formAjouter->isSubmitted()) {
            if ($formAjouter->isValid()) {
                for($i=1; $i<=5; $i++){
                $photo = $formAjouter->get("photo".$i)->getData();
                    if ($photo) {
                    $nomFichier = pathinfo($photo->getClientOriginalName(), PATHINFO_FILENAME);
                    $nomFichier .= uniqid();
                    $nomFichier .= "." . $photo->getExtension();
                    $nomFichier = str_replace(" ", "_", $nomFichier);
                    // on enregistre le fichier téléchargé dans le dossier images
                    $photo->move($this->getParameter("dossier_images"), $nomFichier);
                    $setter ="setPhoto".$i;
                    $chargerPhoto->$setter($nomFichier);
                    
                    
                    }

                }
                $annonce->setPhoto($chargerPhoto);
                $annonce->setDateEnregistrement(new \DateTime());
                $annonce->setMembre($this->getUser());
                $em->persist($annonce);
                $em->flush();
                $this->addFlash("success", "Votre Annonce à bien été rajouter");
                return $this->redirectToRoute("accueil");
               
            }
        }
         return $this->render('annonce/new.html.twig', [
                            'annonce' => $annonce,
                            'form' => $formAjouter->createView(),
                ]);
    }

}
