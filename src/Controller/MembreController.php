<?php

namespace App\Controller;

use App\Entity\Membre;
use App\Form\MembreType;
use App\Repository\MembreRepository;
use App\Repository\AnnonceRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Security\LoginFormAuthenticator;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Guard\GuardAuthenticatorHandler;
/**
 * @Route("/membre")
 */
class MembreController extends AbstractController
{
    /**
     * @Route("/", name="membre_index", methods={"GET"})
     */
    public function index(MembreRepository $membreRepository): Response
    {
        return $this->render('membre/index.html.twig', [
            'membres' => $membreRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="membre_new", methods={"GET","POST"})
     */
    public function new(Request $request,UserPasswordEncoderInterface $passwordEncoder, GuardAuthenticatorHandler $guardHandler, LoginFormAuthenticator $authenticator): Response
    {
        $membre = new Membre();
        $form = $this->createForm(MembreType::class, $membre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            
            $membre->setPassword(
                $passwordEncoder->encodePassword(
                    $membre,
                    $form->get('password')->getData()
                )
            );
            $entityManager = $this->getDoctrine()->getManager();
            
            $entityManager->persist($membre);
            $entityManager->flush();
          
            return $this->redirectToRoute('membre_index');
        }

        return $this->render('membre/new.html.twig', [
            'membre' => $membre,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="membre_show", methods={"GET"},requirements={"id"="\d+"})
     */
    public function show(Membre $membre): Response
    {
        return $this->render('membre/show.html.twig', [
            'membre' => $membre,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="membre_edit", methods={"GET","POST"},requirements={"id"="\d+"})
     */
    public function edit(Request $request, Membre $membre): Response
    {
        $form = $this->createForm(MembreType::class, $membre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('membre_index');
        }

        return $this->render('membre/edit.html.twig', [
            'membre' => $membre,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="membre_delete", methods={"DELETE"},requirements={"id"="\d+"})
     */
    public function delete(Request $request, Membre $membre): Response
    {
        if ($this->isCsrfTokenValid('delete'.$membre->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($membre);
            $entityManager->flush();
        }

        return $this->redirectToRoute('membre_index');
    }
    
     /**
     * @Route("/profil", name="profil", methods={"GET"})
     */
    public function profil(MembreRepository $mr,AnnonceRepository $ar): Response
    {
        return $this->render('membre/profil.html.twig',[
            'annonces'=>$ar->findAll(),
        ]
                );
    }
    

    
}
