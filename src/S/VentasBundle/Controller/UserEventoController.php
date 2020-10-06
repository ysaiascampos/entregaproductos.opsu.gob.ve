<?php

namespace S\VentasBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use S\VentasBundle\Entity\UserEvento;
use S\VentasBundle\Form\UserEventoType;
use Doctrine\ORM\EntityRepository;

/**
 * UserEvento controller.
 *
 * @Route("/userevento")
 */
class UserEventoController extends Controller
{

    /**
     * Lists all UserEvento entities.
     *
     * @Route("/", name="userevento")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        if('ROLE_SUPER_ADMIN'==$this->getUser()->getRoles()[0]){
            $entities = $em->getRepository('SVentasBundle:UserEvento')->findAll();
        }else{
            $entities = $em->getRepository('SVentasBundle:UserEvento')->findBy(array('roles'=>$this->getUser()->getRoles()[0]));
        }
        //Paginador del menu. 
        $paginator  = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
        $entities,
        $this->get('request')->query->get('page', 1)/*page number*/,
         10/*limit per page*/);
        // parameters to template
        return $this->render('SVentasBundle:UserEvento:index.html.twig', array('pagination' => $pagination));
    }
    /**
     * Creates a new UserEvento entity.
     *
     * @Route("/", name="userevento_create")
     * @Method("POST")
     * @Template("SVentasBundle:UserEvento:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new UserEvento();
        $form = $this->createCreateForm($entity);
        
        
        $form->handleRequest($request);
        


        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity->setRoles($this->getUser()->getRoles()[0]);
            $em->persist($entity);
            $em->flush();
            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->crear('UserEvento',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em->persist($bitacora); 
            $em->flush();

            return $this->redirect($this->generateUrl('userevento_show', array('id' => $entity->getId())));
        }

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Creates a form to create a UserEvento entity.
     *
     * @param UserEvento $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(UserEvento $entity)
    {
        $form = $this->createForm(new UserEventoType(), $entity, array(
            'action' => $this->generateUrl('userevento_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new UserEvento entity.
     *
     * @Route("/new", name="userevento_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $entity = new UserEvento();
        $form   = $this->createCreateForm($entity);
        $form->add('idEvento', 'entity', array(
                'label' => 'Evento ','empty_value' => 'Seleccione',  "required"=> true,
                'class' => 'S\VentasBundle\Entity\Eventos',
                'query_builder' => function(EntityRepository $er ){
                    return $er->createQueryBuilder('w')
                  ->orderBy('w.id', 'ASC')
                  ->where("w.rolesUsuario='".$this->getUser()->getRoles()[0]."'");
              }))
                ->add('idUser', 'entity', array(
                'label' => 'Usuario: ','empty_value' => 'Seleccione',  "required"=> true,
                'class' => 'S\VentasBundle\Entity\User',
                'query_builder' => function(EntityRepository $er ){
                    return $er->createQueryBuilder('w')
                  ->orderBy('w.username', 'ASC')
                  ->where('w.userFather ='.$this->getUser()->getId() .' or '. 'w.id ='.$this->getUser()->getId());
              }));

        return array(
            'entity' => $entity,
            'form'   => $form->createView(),
        );
    }

    /**
     * Finds and displays a UserEvento entity.
     *
     * @Route("/{id}", name="userevento_show")
     * @Method("GET")
     * @Template()
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:UserEvento')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find UserEvento entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
     * Displays a form to edit an existing UserEvento entity.
     *
     * @Route("/{id}/edit", name="userevento_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:UserEvento')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find UserEvento entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return array(
            'entity'      => $entity,
            'form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }

    /**
    * Creates a form to edit a UserEvento entity.
    *
    * @param UserEvento $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(UserEvento $entity)
    {
        $form = $this->createForm(new UserEventoType(), $entity, array(
            'action' => $this->generateUrl('userevento_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing UserEvento entity.
     *
     * @Route("/{id}", name="userevento_update")
     * @Method("PUT")
     * @Template("SVentasBundle:UserEvento:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SVentasBundle:UserEvento')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find UserEvento entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $entity->setRoles($this->getUser()->getRoles()[0]);
            $em->flush();
            $bitacora = $em->getRepository('SVentasBundle:Bitacora')->editar('UserEvento',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em->persist($bitacora); 
            $em->flush();

            return $this->redirect($this->generateUrl('userevento_edit', array('id' => $id)));
        }

        return array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        );
    }
    /**
     * Deletes a UserEvento entity.
     *
     * @Route("/{id}", name="userevento_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('SVentasBundle:UserEvento')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find UserEvento entity.');
            }
            $em2 = $this->getDoctrine()->getManager();
            $bitacora = $em2->getRepository('SVentasBundle:Bitacora')->eliminar('UserEvento',$entity->getId(),$entity,$this->getUser()->getId(),$_SERVER['REMOTE_ADDR']);
            $em2->persist($bitacora); 
            $em2->flush();
            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('userevento'));
    }

    /**
     * Creates a form to delete a UserEvento entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('userevento_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
